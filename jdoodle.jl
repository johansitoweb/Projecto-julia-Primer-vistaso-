using Printf

# Estructura para almacenar las tareas
tasks = Dict{String, Bool}()

function add_task(task)
    tasks[task] = false  # Nueva tarea por defecto está pendiente
    println("Tarea \"$task\" agregada.")
end

function remove_task(task)
    delete!(tasks, task)
    println("Tarea \"$task\" eliminada.")
end

function complete_task(task)
    tasks[task] = true
    println("Tarea \"$task\" marcada como completada.")
end

function list_tasks()
    for (task, completed) in tasks
        if completed
            @printf("✅ %s\n", task)
        else
            @printf("❌ %s\n", task)
        end
    end
end

# Bucle principal de la aplicación
while true
    println("\nOpciones:")
    println("1. Agregar tarea")
    println("2. Eliminar tarea")
    println("3. Marcar tarea como completada")
    println("4. Mostrar lista de tareas")
    println("5. Salir")

    choice = parse(Int, readline())

    if choice == 1
        print("Ingrese la tarea: ")
        task = readline()
        add_task(task)
    elseif choice == 2
        print("Ingrese la tarea a eliminar: ")
        task = readline()
        remove_task(task)
    elseif choice == 3
        print("Ingrese la tarea a marcar como completada: ")
        task = readline()
        complete_task(task)
    elseif choice == 4
        list_tasks()
    elseif choice == 5
        break
    else
        println("Opción inválida.")
    end
end